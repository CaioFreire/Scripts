#!/usr/bin/perl -w 

@npvs = (27,29,30,31,32,33,34,35,36,37,38,39,40,42,43);


foreach $inter(@npvs){
	#print "$inter";
#	$inter=27;
	chdir "/Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter";
	open OUT, ">$inter.bamlist";
	system ("mv NPV\'$inter\'.sorted NPV\'$inter\'.sorted.bam");
	print OUT "./NPV$inter.sorted.bam";
	close OUT;
	system("~/angsd/angsd -bam \'$inter\'.bamlist -doSaf 1 -anc NPV\'$inter\'.fasta -GL 2 -P 24 -out NPV\'$inter\'.out");
	system("~/angsd/misc/realSFS NPV\'$inter\'.out.saf.idx -P 24 > NPV\'$inter\'.sfs");
	system("~/angsd/angsd -bam \'$inter\'.bamlist -doSaf 1 -anc NPV\'$inter\'.fasta -GL 2 -out NPV\'$inter\'.out -doThetas 1 -pest NPV\'$inter\'.sfs");
	system("~/angsd/misc/thetaStat make_bed  NPV\'$inter\'.out.thetas.gz");
	system("~/angsd/misc/thetaStat do_stat NPV\'$inter\'.out.thetas.gz -nChr 1");
	system("~/angsd/misc/thetaStat do_stat NPV\'$inter\'.out.thetas.gz -nChr 1 -win 500 -step 100 -outnames NPV\'$inter\'.out.window.thetas.gz")


	#system("/Applications/research_tools/bowtie2-2.2.9/bowtie2 -x NPV\'$inter\' -S NPV\'$inter\'.sam --no-discordant --no-mixed --threads 20 --fr -1 NPV\'$inter\'_R1_001_val_1.fq -2 NPV\'$inter\'_R2_001_val_2.fq");
	#system("samtools view -bS NPV\'$inter\'.sam > NPV\'$inter\'.bam");
	#system ("samtools sort NPV\'$inter\'.bam  -T NPV\'$inter\'.temp -o NPV\'$inter\'.sorted");
	#system("samtools faidx NPV$inter.fasta");
	#system("samtools mpileup -uf NPV$inter.fasta NPV\'$inter\'.sorted | bcftools call -mvO z -o NPV\'$inter\'.vcf.gz");
	#system("bcftools view NPV\'$inter\'.bcf"); 
	#system ("rm *.sam");
	#system ("rm *.bam");
	
	#$result = `/Applications/research_tools/trim_galore_v0.4.0/trim_galore --clip_R1 20 --clip_R2 20 --three_prime_clip_R1 2 --three_prime_clip_R2 2 --paired /Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter/NPV"$inter"_R1_001.fastq /Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter/NPV"$inter"_R2_001.fastq`;
	#chdir "/Users/caio/Desktop/S205-PaoloZanoto-27372346";
}

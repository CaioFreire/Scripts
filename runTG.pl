#!/usr/bin/perl -w 

@npvs = (27,29,30,31,32,33,34,35,36,37,38,39,40,42,43);


foreach $inter(@npvs){
	#print "$inter";
	chdir "/Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter";
	$result = `/Applications/research_tools/trim_galore_v0.4.0/trim_galore --clip_R1 20 --clip_R2 20 --three_prime_clip_R1 2 --three_prime_clip_R2 2 --paired /Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter/NPV"$inter"_R1_001.fastq /Users/caio/Desktop/S205-PaoloZanoto-27372346/NPV$inter/NPV"$inter"_R2_001.fastq`;
	chdir "/Users/caio/Desktop/S205-PaoloZanoto-27372346";
}


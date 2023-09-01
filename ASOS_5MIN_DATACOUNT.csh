#!/ben/csh

# AVS3210 ASOS 5 MIN DATA DOWNLOAD
#  STSN Should be a 4 letter ICAO Station ID

# GET STATION ID FROM THE COMMAND LINE

set STN = $argv[1]

if ( -e ${STN}_5MIN_COUNT.csv ) then
  rm ${STN}_5MIN_COUNT.csv
endif

# LOOP ON YEAR
foreach YY (  2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 )

# LOOP ON MONTH

foreach MM ( 01 02 03 04 05 06 07 08 09 10 11 12 )

set count = 0
set days  = 30 

if ( $MM == "01" ||  $MM == "03" || $MM == "05" || $MM == "07" || $MM == "08" || $MM == "10" || $MM == "12" ) then
 set days = 31
endif

if ( $MM == "02" ) then
 set days = 28
 if ( $YY == "2004" || $YY == "2008" || $YY == "2012" || $YY == "2016" || $YY == "2020" || $YY == "2024" || $YY == "2028" || $YY == "2032" ) then
    set days  = 29
  endif
endif

if (  -e ASOS5MIN_${STN}${YY}${MM}.dat.gz ) then
 set incount = `zgrep -c ${STN} ASOS5MIN_${STN}${YY}${MM}.dat.gz`
 set count = `echo "$incount * 1.0" | bc`
 set expcnt = `echo "$days * 24.0 * 12.0" | bc`
 set expper = `echo "scale = 10; $count/$expcnt * 100.0" | bc` 
 echo "${YY}-${MM}"
 echo "${YY}-${MM}-01\t$count\t$expcnt\t$expper" >> ${STN}_5MIN_COUNT.csv
else
 set count = 0.0
 set expcnt = `echo "$days * 24.0 * 12.0" | bc`
 set expper = `echo "scale = 10; $count/$expcnt * 100.0" | bc`
 echo "${YY}-${MM}-01\t$count\t$expcnt\t$expper" >> ${STN}_5MIN_COUNT.csv
endif

end

end
#END MONTH LOOP

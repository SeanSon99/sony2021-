#!/bin/csh

# AVS3210 ASOS 1 MIN DATA DOWNLOAD
#  STSN Should be a 4 letter ICAO Station ID

# GET STATION ID FROM THE COMMAND LINE

set STN = $argv[1]

if ( -e ASOS1_GET.dat ) then

rm ASOS1_GET.dat

endif

# LOOP ON YEAR
foreach YY ( 2017 2018 2019 2020 2021 )
#foreach YY ( 2013 )

# LOOP ON MONTH

foreach MM ( 01 02 03 04 05 06 07 08 09 10 11 12 )

if ( ! -e ASOS1MIN_${STN}${YY}${MM}.dat.gz ) then

echo "wget -O ASOS1MIN_${STN}${YY}${MM}.dat https://www.ncei.noaa.gov/pub/data/asos-onemin/6405-${YY}/64050${STN}${YY}${MM}.dat" >> ASOS1_GET.dat
echo "gzip ASOS1MIN_${STN}${YY}${MM}.dat" >> ASOS1_GET.dat

endif

end

end
#END MONTH LOOP


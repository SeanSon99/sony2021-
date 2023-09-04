#!/bin/csh

# AVS3210 ASOS 1 MIN DATA DOWNLOAD
#  STSN Should be a 4 letter ICAO Station ID

# GET STATION ID FROM THE COMMAND LINE

set STN = $argv[1]

# LOOP ON YEAR
foreach YY ( 2016 2017 2018 2019 2020 2021 )

# LOOP ON MONTH

foreach MM ( 01 02 03 04 05 06 07 08 09 10 11 12 )

if ( ! -e ASOS1MIN_${STN}${YY}${MM}.dat.gz ) then

wget https://www.ncei.noaa.gov/pub/data/asos-onemin/6405-2013/64050${STN}${YY}${MM}.dat
mv 64050${STN}${YY}${MM}.dat ASOS1MIN_${STN}${YY}${MM}.dat
gzip ASOS1MIN_${STN}${YY}${MM}.dat

endif

end

end
#END MONTH LOOP

#!/bin/bash

# array of hashtags from the maps.py file
declare -a StringArray=(
    '#covid'
    '#covid2019'
    '#covid-2019'
    '#covid19'
    '#covid-19'
    '#covid_19'
    '#pandemic'
    '#coronavirus'
    '#corona'
    '#masks'
    '#virusmask'
    '#handmademask'
    '#surgicalmasks'
    '#surgicalmask'
    '#facemasks'
    '#facemask'
    '#maskup'
    '#medicalmask'
    '#masked'
    '#arrestfauci'
    '#firefauci'
    '#faucifacts'
    '#hospital'
    '#essentialworkers'
    '#essentialworkerfear'
    '#essential'
    '#essentialworkerrespect'
    '#chinavirus'
    '#staysafestayhome'
    '#lockdown'
    '#quarantine'
    '#quarantineandchill'
    '#flattenthecurve'
    '#vaccine'
    '#covidvaccine'
    '#covid19vaccine')

# iterate over string of hashtags
for val in ${StringArray[@]}; do
    src/visualize.py --input_path=reduced_lang --key=$val | cat > viz/$val &&
    src/visualize.py --input_path=reduced_country --key=$val | cat > viz/$val
done

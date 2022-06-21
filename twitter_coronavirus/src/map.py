#!/usr/bin/env python3

# command line args
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('--input_path',required=True)
parser.add_argument('--output_folder',default='outputs')
args = parser.parse_args()

# imports
import os
import zipfile
import datetime 
import json
from collections import Counter,defaultdict

# load keywords
hashtags = [
    '#covid',
    '#covid2019',
    '#covid-2019',
    '#covid19',
    '#covid-19',
    '#covid_19',
    '#pandemic',
    '#coronavirus',
    '#corona',
    '#masks',
    '#virusmask',
    '#handmademask',
    '#surgicalmasks',
    '#surgicalmask',
    '#facemasks',
    '#facemask',
    '#maskup'
    '#medicalmask',
    '#masked',
    '#arrestfauci',
    '#firefauci',
    '#faucifacts',
    '#hospital',
    '#essentialworkers',
    '#essentialworkerfear',
    '#essential',
    '#essentialworkerrespect',
    '#chinavirus',
    '#staysafestayhome',
    '#lockdown',
    '#quarantine',
    '#quarantineandchill',
    '#flattenthecurve',
    '#vaccine',
    '#covidvaccine',
    '#covid19vaccine'
    ]

# initialize counters
count_lang = defaultdict(lambda: Counter())
count_country = defaultdict(lambda: Counter())

# open the zipfile
with zipfile.ZipFile(args.input_path) as archive:

    # loop over every file within the zip file
    for i, filename in enumerate(archive.namelist()):
        print(datetime.datetime.now(), args.input_path, filename)

        # open the inner file
        with archive.open(filename) as f:

            # loop over each line in the inner file
            for line in f:

                # load the tweet as a python dictionary
                tweet = json.loads(line)

                # convert text to lower case
                text = tweet['text'].lower()

                # search hashtags
                for hashtag in hashtags:
                    lang = tweet['lang']
                    country = tweet['place']['country_code'] if tweet['place'] is not None and 'country_code' in tweet['place'] else 'None'
                    if hashtag in text:
                        count_lang[hashtag][lang] += 1
                        count_country[hashtag][country] += 1
                    count_lang['_all'][lang] += 1
                    count_country['_all'][country] += 1


# open the outputfile
try:
    os.makedirs(args.output_folder)
except FileExistsError:
    pass

output_path_base = os.path.join(args.output_folder, os.path.basename(args.input_path))
output_path_lang = output_path_base+'.lang'
output_path_country = output_path_base+'.country'

print('saving', output_path_lang)
print('saving', output_path_country)
with open(output_path_lang,'w') as fl: fl.write(json.dumps(count_lang))
with open(output_path_country, 'w') as fc: fc.write(json.dumps(count_country))

#!/bin/bash

# --------------
#/ Do not remove
set -euxo pipefail
. /opt/conda/etc/profile.d/conda.sh && conda activate base
conda info -a
#\ Do not remove
# --------------

# Create your environment
conda env create -n research -f devtools/environment.yml
conda activate research
# pip install my_unreleased_package/ --no-deps

# Some debugging -- consider keeping this as part of your reproducibility efforts!
conda list --show-channel-urls

## Normally you would run something like this:
# python data/scripts/train.py --input data/input/dataset.json --output data/output/report.txt
## We will just use a dummy example here
python -m this | tee output/zen.txt
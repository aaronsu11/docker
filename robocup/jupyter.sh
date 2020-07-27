#!/bin/bash
python3 -m ipykernel.kernelspec

jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root

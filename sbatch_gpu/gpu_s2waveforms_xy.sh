#!/bin/bash

#SBATCH --job-name=nn_gpu
#SBATCH --time=01:00:00

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64GB

#SBATCH --partition=gpu2
#SBATCH --gres=gpu:2
##SBATCH --mem-per-gpu=12GB

#SBATCH --mail-type=END
#SBATCH --mail-user=dbarge

#SBATCH --output=log_gpu_s2waveforms_xy.txt # output log file
#SBATCH --error=log_gpu_s2waveforms_xy.txt  # error file

source ~/.bash/.setup_ml.sh

# Load all required modules below. As an example we load cuda/9.1
echo "Loading CUDA..."
module load cuda/10.1
echo "\n>nvidia-smi\n"
nvidia-smi

srun python ../nn_s2waveforms_xy_train.py -directory /project2/lgrandi/dbarge/pax_merge/temp_s2/ -gpu True -max_dirs 2 -events_per_batch 100 -downsample 2

# Add lines here to run your GPU-based computations.
echo "Done"

[ -d ./jcuda ] || mkdir ./jcuda
GIT_PATH=/home/nvidia/project
cd jcuda
for project in jcuda-common jcuda-main jcuda jcublas jcufft jcusparse jcurand jcusolver jnvgraph jcuda-parent
do 
  git clone https://github.com/jcuda/${project}.git
  cd ${project}
  #git checkout tags/version-0.7.5b # This is optional, only if compiling on CUDA 0.7.5
  git checkout tags/version-0.9.0d-RC01
  cd ${GIT_PATH}/edge-sched/jcuda
done
git clone https://github.com/jcuda/jcudnn.git
cd jcudnn
git checkout tags/version-0.9.0c-RC00
cd ..
cmake ./jcuda-main
make all
cd jcuda-main

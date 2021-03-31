go mod init ctm
go mod tidy
go build ./...

if ! command -v conda &> /dev/null
then
  apt-get update
  apt-get install -y python-pip
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
  bash ~/miniconda.sh -b -p ~/miniconda
  rm ~/miniconda.sh
fi
export PATH=~/miniconda/bin:$PATH

pip install -r requirements.txt

conda install onnx -c conda-forge
conda install pytorch torchvision -c pytorch

gunzip -c ./data/embedding/word_embeddings.vec.gz > ./data/embedding/word_embeddings

ls ./data/embedding

./script/mesh.sh
./script/ie_parse.sh

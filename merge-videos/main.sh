#!/bin/bash

# Diretório onde os vídeos estão localizados
input_dir="./input"
output_dir="./output"

# Definir a extensão dos vídeos (por exemplo, .mp4)
video_extension="mp4"

# Nome do vídeo final (arquivo de saída)
output_file="$output_dir/final_output.mp4"

# Criar o diretório de saída, caso não exista
mkdir -p "$output_dir"

# Arquivo temporário para armazenar a lista de vídeos
file_list="$output_dir/file_list.txt"

# Limpar o arquivo de lista anterior, caso exista
> "$file_list"

# Adicionar cada vídeo do diretório ao arquivo de lista
for video in "$input_dir"/*.$video_extension; do
  if [ -f "$video" ]; then
    # Usar caminho completo e escapado corretamente para Windows
    win_path=$(realpath "$video" | sed 's/\/c\//C:\//g')
    echo "file '$win_path'" >> "$file_list"
  fi
done

# Fazer o merge de todos os vídeos listados no arquivo de lista
ffmpeg -f concat -safe 0 -i "$file_list" -c copy "$output_file"

# Limpar o arquivo temporário de lista
rm "$file_list"

echo "Todos os vídeos foram mesclados em $output_file"

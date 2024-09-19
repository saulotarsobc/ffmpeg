#!/bin/bash

# Diretório onde os vídeos estão localizados
input_dir="./input"
temp_dir="./temp"
output_dir="./output"

# Definir a extensão dos vídeos (por exemplo, .mp4)
video_extension="mp4"

# Nome do vídeo final (arquivo de saída)
output_file="$output_dir/final_output.mp4"

# Criar o diretório de saída e o diretório temporário, caso não existam
mkdir -p "$output_dir"
mkdir -p "$temp_dir"

# Arquivo temporário para armazenar a lista de vídeos
file_list="$output_dir/file_list.txt"

# Limpar o arquivo de lista anterior, caso exista
> "$file_list"

# Recodificar cada vídeo para o formato uniforme e mover para o diretório temporário
for video in "$input_dir"/*.$video_extension; do
  if [ -f "$video" ]; then
    # Nome do arquivo de saída para o vídeo uniformizado
    base_name=$(basename "$video")
    temp_video="$temp_dir/$base_name"
    
    # Recodificar o vídeo
    ffmpeg -i "$video" -c:v libx264 -crf 23 -preset veryfast -c:a aac -b:a 192k "$temp_video"
    
    # Adicionar o vídeo uniformizado à lista de arquivos com caminho relativo
    echo "file '../temp/$base_name'" >> "$file_list"
  fi
done

# Verificar se o arquivo de lista foi gerado corretamente
echo "Conteúdo do arquivo de lista de arquivos:"
cat "$file_list"

# Fazer o merge de todos os vídeos uniformizados listados no arquivo de lista
ffmpeg -f concat -safe 0 -i "$file_list" -c copy "$output_file"

# Limpar os diretórios temporários
rm -r "$temp_dir"
rm "$file_list"

echo "Todos os vídeos foram mesclados em $output_file"

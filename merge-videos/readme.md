# Script de Merge de Vídeos

Este script em Bash permite a junção de vários vídeos de um diretório específico em um único arquivo de vídeo utilizando o `ffmpeg`. Ele foi projetado para funcionar em sistemas que tenham o `ffmpeg` instalado e que suportem scripts `.sh` (como ambientes Unix, Git Bash ou MSYS2 no Windows).

## Pré-requisitos

1. **FFmpeg**: O `ffmpeg` precisa estar instalado no sistema e acessível no PATH.

   - Para verificar se o `ffmpeg` está instalado, execute o seguinte comando no terminal:
     ```bash
     ffmpeg -version
     ```
   - Caso não tenha o `ffmpeg` instalado, você pode baixá-lo em: [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)

2. **Terminal com suporte a Bash**:
   - Este script requer um terminal que suporte scripts `.sh`, como:
     - Linux/macOS: Terminal padrão
     - Windows: Git Bash ou MSYS2 (ou qualquer outro que suporte Bash)

## Estrutura de Pastas

O script pressupõe a seguinte estrutura de pastas:

```bash
project-root/
├── input/ # Diretório onde os vídeos estão localizados
├── output/ # Diretório onde o vídeo final será salvo
└── merge.sh # O script Bash para fazer o merge
```

- Coloque os vídeos a serem mesclados no diretório `input`.
- O vídeo final será salvo no diretório `output`.

## Como Usar

1. Coloque todos os vídeos que deseja mesclar no diretório `input`. Certifique-se de que todos tenham a mesma extensão (por exemplo, `.mp4`).
2. Execute o script no terminal:

```bash
./merge.sh
```

3. **Após a execução, o vídeo mesclado será salvo como final_output.mp4 no diretório output.**

## Limitações

> O script pressupõe que todos os vídeos tenham o mesmo codec e resolução. Caso contrário, o ffmpeg pode falhar ou você pode precisar recodificar os vídeos antes de mesclá-los.

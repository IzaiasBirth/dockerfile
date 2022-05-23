# Início do arquivo; a instrução FROM (obrigatória) define a imagem que será tomada como base
FROM ubuntu 

# Inserir metadados dentro da iamgem; informações sobre
LABEL MAINTAINER="Izaias Nascimento <izaiasenelly@gmail.com>"
LABEL APP_VERSION="1.0.0"

# Passar variáveis de ambiente 
ENV NPM_VERSION=8 ENVIRONMENT=PROD

# RUN Executa comandos dentro da iamegem; instruções a serem executadas 
RUN apt update && apt install -y git nano

# WORKDIR define o diretório onde as instruções abaixo serão executadas 
WORKDIR /usr/share/myapp

RUN npm build

# Instrução que copia arquivos da máquina local para dentro da imagem
COPY ./requirements.txt requirements.txt

# ADD Faz o mesmo que o COPY, porém, pega arquivos compactados na origem e entrega descompactados no destino. Também permite baixar arquivos de URL
ADD ./files.tar.gz ./

RUN useradd izaias

# Define o usuário padrão do container a partir da definição
USER izaias

# Expoe portas do container para outros containers
EXPOSE 8080

# Cria um ponto de montagem na máquina física
VOLUME [ "/data" ]

# Define um comando padrão - o que será feito pelo container (não pode ser substituído)
ENTRYPOINT [ "ping" ]

# Define um comando padrão - o que será feito pelo container (pode ser substituído)
CMD ["ping", "localhost"]

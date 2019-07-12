# Curso de Docker

## Comandos

```bash
# rodar um container

docker run ****

# listar containers ativos
docker ps

# listar todos os containers 
docker ps -a

# listar apenas os ids dos container ativos
docker ps -q

# reiniciar um container
docker start id-do-container

# parar um container
docker stop id-do-container

# parar todos os containers
docker stop -t 0 $(docker ps -q)

# reiniciar um container com terminal
docker start -a -i id-do-container

# remover um container
docker rm id-do-container

# remover um container que está rodando
docker rm -f id-do-container

# limpar todos os container inativos
docker container prune

# listar as imagens
docker images

# remover imagem
docker rmi nomeOUid-da-imagem

# parar um container com pouco tempo
docker stop -t segundos id-do-container

#rodar um container em background e atribuir uma porta aleatória
docker run -d -P nome-da-imagem

# conferir porta que um container está utilizando
docker port id-do-container

# trazer informações do container
docker inspect id-do-container

# usar o ubuntu com volume atrelado
docker run -it -v "C:\Users\MEU-PC\Desktop:/var/www" ubuntu 
docker run -it -v "path/meu/pc:/path/container" ubuntu 

# Adição do volume onde eu estou
docker run -d -p 8080:3000 -v "$(pwd):/var/www" -w "/var/www" node npm start

# Fazer build de dockerfile
docker build -f meuarquivo.dockerfile -t meuNome/conteudoConteiner caminho-do-arquivo

# Listar redes
docker network ls

# Criar uma nova rede
docker network create --driver bridge minha-rede

# Fazer um container ubuntu em uma rede
docker run -it --name meu-container-de-ubuntu --network minha-rede ubuntu

# Ver informações da rede e computadores conectados
docker network inspect minha-rede

# Build compose
docker-compose build

# Rodar o compose
docker-compose up

# Listar os containers do compose
docker-compose ps

# Parar e remover todos os containers do compose
docker-compose down

# Testar um comando ping entre containers
docker exec -it nome-container ping nome-container-2

```

## Flags
| -opcao | valor |
| -- | -- |
| -it | usar o terminal do container |
| -a | attach -> adicionar uma opção -> pode-se usar no `docker start -a -i id-do-container` para reiniciar um container e abrir o seu terminal |
| -d | rodar em background, não deixando o terminar atrelado ao container |
| -t | utilizado para determinar o tempo |
| -P | atribui uma porta aleatória do container com o SO |
| -p | escolher a porta do container da forma porta-do-pc:porta-do-container |
| --name  | dar um nome ao container criado |
| -e | setar variável de ambiente do tipo => VARIAVEL="valor da variavel"|
| -q | listar apenas os ids |
| -v | criar um volume |
| -w | diretório que um código deverá ser executado `docker run -d -p 8080:3000 -v "C:\Users\MEU-PC\Downloads\volume-exemplo:/var/www" -w "/var/www" node npm start`|
| -f | especificar o arquivo para build |
| -t | tag do usuário que criou |

## Comandos do curso

Segue a lista com os principais comandos utilizados durante o curso:

- Comandos relacionados às informações
```bash
# exibe a versão do docker que está instalada.
docker version
# retorna diversas informações sobre o container.
docker inspect ID_CONTAINER
# exibe todos os containers em execução no momento.
docker ps
# exibe todos os containers, independentemente de estarem em execução ou não.
docker ps -a 
```

- Comandos relacionados à execução
```bash
# cria um container com a respectiva imagem passada como parâmetro.
docker run NOME_DA_IMAGEM
# conecta o terminal que estamos utilizando com o do container.
docker run -it NOME_DA_IMAGEM
# ao executar, dá um nome ao container.
docker run -d -P --name NOME dockersamples/static-site
# define uma porta específica para ser atribuída à porta 80 do container, neste caso 12345.
docker run -d -p 12345:80 dockersamples/static-site
# cria um volume no respectivo caminho do container.
docker run -v "CAMINHO_VOLUME" NOME_DA_IMAGEM 
# cria um container especificando seu nome e qual rede deverá ser usada.
docker run -it --name NOME_CONTAINER --network NOME_DA_REDE NOME_IMAGEM
```
- Comandos relacionados à inicialização/interrupção
```bash
# inicia o container com id em questão.
docker start ID_CONTAINER 
# inicia o container com id em questão e integra os terminais, além de permitir interação entre ambos.
docker start -a -i ID_CONTAINER 
# interrompe o container com id em questão.
docker stop ID_CONTAINER
```

- Comandos relacionados à remoção
```bash
# remove o container com id em questão.
docker rm ID_CONTAINER
# remove todos os containers que estão parados.
docker container prune
# remove a imagem passada como parâmetro.
docker rmi NOME_DA_IMAGEM
```

- Comandos relacionados à construção de Dockerfile
```bash
# cria uma imagem a partir de um Dockerfile.
docker build -f Dockerfile
# constrói e nomeia uma imagem não-oficial
docker build -f Dockerfile -t NOME_USUARIO/NOME_IMAGEM 
# constrói e nomeia uma imagem não-oficial informando o caminho para o Dockerfile.
docker build -f Dockerfile -t NOME_USUARIO/NOME_IMAGEM CAMINHO_DOCKERFILE 
```

- Comandos relacionados ao Docker Hub
```bash
# inicia o processo de login no Docker Hub.
docker login
# envia a imagem criada para o Docker Hub.
docker push NOME_USUARIO/NOME_IMAGEM
# baixa a imagem desejada do Docker Hub. 
docker pull NOME_USUARIO/NOME_IMAGEM
```

- Comandos relacionados à rede

```bash
# mostra o ip atribuído ao container pelo docker (funciona apenas dentro do container).
hostname -i
# cria uma rede especificando o driver desejado.
docker network create --driver bridge NOME_DA_REDE
```

- Docker-compose
```bash
# sobe os serviços criados
docker-compose up
# para os serviços criados.
docker-compose down
# lista os serviços que estão rodando.
docker-compose ps
# executa o comando ping node2 dentro do container alura-books-1
docker exec -it alura-books-1 ping node2
```

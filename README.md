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
| `--name`  | dar um nome ao container criado |
| -e | setar variável de ambiente do tipo => VARIAVEL="valor da variavel"|
| -q | listar apenas os ids |
| -v | criar um volume |
| -w | diretório que um código deverá ser executado `docker run -d -p 8080:3000 -v "C:\Users\MEU-PC\Downloads\volume-exemplo:/var/www" -w "/var/www" node npm start`|
| -f | especificar o arquivo para build |
| -t | tag do usuário que criou |
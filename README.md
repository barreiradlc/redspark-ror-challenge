# README

## Docker setup

> A aplicação possui toda a sua configuração nos arquivos Dockerfile & docker-compose.yml.
> O arquivo Makefile facilita a utilização de comandos `docker compose`, sendo assim ao invés de usar `docker compose up` usará apenas `make up` por exemplo.

Para executar a aplicação será necessário apenas o comando `make up` e todo o resto da mágica já está pronto para acontecer.


## Estruturação de tdd

O projeto está estruturado em TDD para que cada modelo e controller seja testada antes de sua final construção.
Para que crie uma novas models e controllers com seus testes associados utilize os commandos:

```sh
  # Testes
  docker compose run --rm web rails generate 
  rspec:controller <Controller>
  docker compose run --rm web rails generate rspec:model <Model>
  
  # Funcionalidade
  docker compose run --rm web rails generate controller <Controller>
  docker compose run --rm web rails generate model <Model>
```


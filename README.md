
# <img src="home_page/images/logo2.png" width="95"> <h1> SHITECH </h1>

## Sistema de Monitoramento para Cultivo de Shimeji e Champignon

Este projeto visa desenvolver e implementar um sistema de monitoramento de temperatura e umidade para o cultivo de Shimeji (Pleurotus eryngii) e Champignon de Paris (Agaricaceae). Utilizando sensores DHT11 conectados a um Arduino Uno R3, o sistema coleta dados essenciais para o controle do cultivo, aumentando a eficiência da produção. Os dados são processados e visualizados em tempo real por meio de uma ferramenta web acessível via desktop, fornecendo dashboards detalhados para os produtores.

## Objetivo

Aumentar a eficiência da produção de cogumelos em até 20,7% por meio de um monitoramento preciso das condições ambientais durante o cultivo.

## Tecnologias Utilizadas
- Arduino Uno R3: Para capturar dados de temperatura e umidade com sensores DHT11.
- DHT11: Sensores para medição de temperatura (0°C a 50°C) e umidade (20% a 80%).
- Node.js: Processamento de dados da API Dat Acqu Ino.
- MySQL: Banco de dados para armazenamento dos dados coletados.
- ChartJS: Geração de gráficos para visualização de dados nas dashboards.
- HTML, CSS, JavaScript: Desenvolvimento da interface web.
- VirtualBox com Lubuntu: Máquina virtual para hospedar a aplicação e proteger o sistema.
- Figma: Prototipagem da interface.
- Trello: Gerenciamento de tarefas.
- GitHub: Controle de versão e repositório do projeto.

## API DataAcquIno
- [API](https://github.com/BandTec/dat-acqu-ino)

## Recursos

- Arduíno Uno R3: Plataforma para desenvolver o sensor; 
- Fio de conexão para os sistemas eletrônicos (Jumpers); 
- Sensor DHT11: Medição de temperatura e umidade; 
- Ferramenta Figma: Criação do protótipo da ferramenta web; 
- Ferramenta Canva: Criação do diagrama de negócio; 
- Ferramenta Trello: Gestão da equipe e tarefas do Projeto; 
- Ferramenta Git/GitHub: Gestão de repositório de recursos do sistema entre a equipe; 
- Ferramenta Visual Studio Code: Desenvolvimento de código para ferramenta Web (HTML, CSS e JavaScript); 
- Ferramenta MySQL Server: Sistema de gestão de base de dados;
- Ferramenta Arduino IDE: Plataforma usada para inserir o código do sensor no Arduino Uno R3; 
- VirtualBox (VM); Criação de Máquina Virtual como método de segurança de proteção a máquina pessoal e hospedagem da aplicação; 
- API Dat Acqu Ino: responsável por transmitir dados para o banco de dados na VM; 
- API para a criação das dashboards;  
- Sistema Operacional Lubuntu: Sistema que vai ser utilizado na Máquina Virtual; 
- Fio de conexão USB para conectar o arduino ao computador; 
- Node JS: plataforma de desenvolvimento usada para o processamento do código da API Dat Acqu Ino; 
- Computador Desktop que será responsável por toda a operação da movimentação dos dados do sensor para o banco de dados na VM até o site com as dashboards; 
- Biblioteca ChartJS para criação das dashboard;  
- Excel para criação do Product Backlog; 
- Word para criação da documentação;  
- HTML para estruturação do site web; 
- CSS para estilização do site; 
- JAVASCRIPT para implementar funcionalidade nos sites;  
- PowerPoint para criação de diagramas; 
- Canvas para criação de diagramas. 

## Premissas

- O ambiente já estará preparado para a instalação do sistema; 
- O ambiente permanecerá adequado para o funcionamento do sistema; 
- O usuário possuirá uma conexão com a internet. 
- O usuário possuirá um laptop e/ou desktop para navegar no sistema. 
- Os sensores serão disponibilizados pelo cliente. 
- Os sensores funcionarão da maneira correta e precisa para que haja conformidade na medição e armazenamento de dados. 
- Os ares-condicionados e umidificadores funcionarão da maneira correta 
- O computador do usuário receberá alimentação de energia de forma contínua; 
- Haverá conexão USB no computador fornecido para a conexão com o Arduino; 
- A equipe de desenvolvimento terá acesso contínuo a todos os recursos listados como necessários; 
- Não haverá interferências eletromagnéticas significativas que possam afetar a precisão das leituras do sensor; 
- O cliente possuirá um sistema de estufas instalado para o monitoramento adequado das condições do cultivo; 
- O cliente se responsabiliza por fornecer os recursos necessários para a realização do projeto, como tempo e orçamento; 
- A estufa possui um sistema de controle de temperatura e umidade que atende as necessidades da plantação de cogumelos; 

##Restrições 

- Será disponibilizado apenas a versão Desktop; 
- As informações serão exibidas apenas na Aplicação Web (site); 
- A Aplicação Web (site) será desenvolvida apenas para computador/notebook; 
- O acesso a Aplicação Web (site) é restrito exclusivamente a clientes, gerentes e administradores do projeto; 
- Cliente terá acesso apenas a aplicação web, não possuindo acesso ao código fonte do sistema; 
- Os sensores utilizados irão apenas capturar dados relacionado à umidade e temperatura; 
- O sistema do Arduíno deve possuir uma fonte de energia contínua para funcionar; 
- O Arduino não possuirá conexão via WI-FI; 
- Todos os dados deverão ser armazenados unicamente no Banco de Dados da Shitech; 
- O sistema irá monitorar apenas cogumelos Champignon e Shimeji; 
- Os sensores possuem limitações referentes a precisão e durabilidade; 
- O projeto tem restrição de tempo, devendo ser entregue até o dia 05/12; 
- Fontes de energias podem ser cessadas ou sofrer flutuações, interrompendo e/ou atrapalhando o funcionamento do sistema e sua coleta de dados; 
- O sensor DHT11 tem limite de captação de temperatura que varia entre 0°C e 50°C; 
- O sensor DHT11 possui uma precisão de ± 2% °C; 
- O sensor DHT11 possui uma precisão de ± 5% °C; 
- O sensor DHT11 possui um tempo de resposta de 2 segundos; 
- O projeto possui um limite de orçamento, que deverá ser respeitado durante o desenvolvimento do projeto; 


## Autores

- [@Felipe-Ortega](https://github.com/Felipe-Ortega)
- [@lucaspaessptech](https://github.com/lucaspaessptech)
- [@amandampedroza](https://github.com/amandampedroza)
- [@plzonly](https://github.com/plzonly)
- [@Laiza2106](https://github.com/Laiza2106)
- [@Lara-Soares](https://github.com/Lara-Soares)


## Licença

Este projeto está sob a licença MIT.

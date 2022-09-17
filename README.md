# DESCRIZIONE
Questo progetto è stato realizzato nell'ambito del corso Architetture Software e Sicurezza Informatica 2021/2022.
La nostra applicazione fornisce un servizio di fitness che dà la possibilità di richiedere e fornire schede di 
allenamento personalizzate secondo gli obiettivi di ogni singolo cliente. 

# INSTALLAZIONE
- Clonare la repository:
```
git clone https://github.com/mariadianacalugaru/fitnet
```
- Installare le gemme:
```
bundle install
```
- Migrazione database:
```
rake db:migrate
```
- Avvio server all'interno della repository:
```
bin/rails server
```
- Esecuzione test accettazione:
```
bin/rake cucumber
```
- Esecuzione test unità:
```
bundle exec rspec
```

# PROGETTO REALIZZATO DA:
- Maria Diana Calugaru
- Samuele Cervo
- Rosapia Laudati
- Andrea Di Vincenzo
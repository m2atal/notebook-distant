# notebook-distant
Explications du comment faire pour utiliser des notebooks jupyter en distancielle

1. Copier le script `jupyter.sh` sur le gpue voulu. *N.B: ne pas oublier de le rendre exécutable*

2. Lancer le script en distant `ssh -L <port_local>:gpue3:<port_notebook> <user>@skinner './jupyter.sh <port_notebook>'`

3. Lancer le port forwarding `ssh -L <port_local>:gpue3:<port_notebook> -N s156053@skinner`

4. Pour stopper le notebook `ssh -L <port_local>:gpue3:<port_notebook> <user>@skinner './jupyter.sh stop'`

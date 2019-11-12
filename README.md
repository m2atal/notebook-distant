# notebook-distant
Explications du comment faire pour utiliser des notebooks jupyter en distancielle

## Pour les Manceaux 

### À la fac

1. Copier le script `jupyter.sh` sur le gpue voulu. *N.B: ne pas oublier de le rendre exécutable*

2. Lancer le script en distant `ssh -L <port_local>:gpue3:<port_notebook> <user>@skinner './jupyter.sh <port_notebook>'`

3. Lancer le port forwarding `ssh -L <port_local>:gpue3:<port_notebook> -N s156053@skinner`

4. Pour stopper le notebook `ssh -L <port_local>:gpue3:<port_notebook> <user>@skinner './jupyter.sh stop'`

### À la casa




## Pour les nantais
### À la fac

1. Lance le port forward entre l'utilisateur et transit: `ssh -L <port_local>:transit.univ-lemans.fr:<port_transit> <user_nantes>@bastion.etu.univ-nantes.fr`
2. Lance le notebook depuis transit: `ssh -L <port_transit>:gpue<X>:<port_notebook> <user_lemans>@skinner './jupyter.sh <port_notebook>'`
3. Lance le port forward entre transit et gpuX `ssh -L <port_transit>:gpue<X>:<port_notebook> <user>@skinner`


### À la casa



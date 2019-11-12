# notebook-distant
Explications du comment faire pour utiliser des notebooks jupyter en distancielle

## Informations

* Pour lancer le notebook utiliser la commande suivante `./jupyter.sh <port_notebook>`
* Pour stopper le notebook utiliser la commande suivante `./jupyter.sh stop`

*N.B: Tant que vous ne stoppez pas le notebook avec la commande ci-dessus. celui-ci ne s'arrêtera pas sauf si les gpus sont restart. N'oubliez donc pas de les stoppez lorsque vous avez fini.*

## Installation 

1. Copier le script `jupyter.sh` sur le gpue<X> voulu. *N.B: ne pas oublier de le rendre exécutable*

## Utilisation à la fac

### Pour les Manceaux 

1. (Si nécessaire) Lancer le script en distant `ssh -L <port_local>:gpue<X>:<port_notebook> <user>@tra './jupyter.sh <port_notebook>'`
2. Lancer le port forwarding `ssh -L <port_local>:gpue<X>:<port_notebook> -N <user_lemans>@skinner`

### Pour les nantais

1. Lance le port forward entre l'utilisateur et transit: `ssh -L <port_local>:transit.univ-lemans.fr:<port_transit> <user_nantes>@bastion.etu.univ-nantes.fr`
2. (Si nécessaire)Lance le notebook depuis transit: `ssh -L <port_transit>:gpue<X>:<port_notebook> <user_lemans>@skinner './jupyter.sh <port_notebook>'`
3. Lance le port forward entre transit et gpuX `ssh -L <port_transit>:gpue<X>:<port_notebook> <user>@skinner`


### Utilisation à la casa

1. Lance le port forwarding entre l'utilisateur et skinner (nécessite de taper le mdp 2 fois ): `ssh -L <port_local>:skinner:<port_skinner> -A -t -l <user_lemans> transit.univ-lemans.fr ssh skinner`
2. (Si nécessaire) Lance le notebook sur le port choisit: `ssh gpue<X> './jupyter.sh <port_notebook>`
3. Lance le port forwarding entre skinner et le gpue<X>: `ssh -L <port_skinner>:localhost:<port_notebook> gpue<X>`

# notebook-distant
Explications du comment faire pour utiliser des notebooks jupyter en distancielle

## Informations

* Pour lancer le notebook utiliser la commande suivante `./jupyter.sh <port_notebook>`
* Pour stopper le notebook utiliser la commande suivante `./jupyter.sh stop`

*N.B: Tant que vous ne stoppez pas le notebook avec la commande ci-dessus. celui-ci ne s'arrêtera pas sauf si les gpus sont restart. N'oubliez donc pas de les stoppez lorsque vous avez fini.*

## Installation 

1. Copier le script `jupyter.sh` sur le gpue<X> voulu. *N.B: ne pas oublier de le rendre exécutable*

## Utilisation

`user_lemans`: identifiant utilisateur le Mans.
`user_nantes`: identifiant utilisateur Nantes.
`port_notebook`: le port du notebook choisit.
`<X>`: indique le numéro du gpu cible.

### A la fac

#### Pour les Manceaux 
<pre>
 +--------+     +---------+     +-------+
 |        |     |         |     |       |
 |  User  | ==> | Skinner | ==> |  GPU  |
 |        |     |         |     |       |
 +--------+     +---------+     +-------+
</pre>

1. Lancer le port forwarding: `ssh -L <port_notebook>:gpue<X>:<port_notebook> <user_lemans>@skinner`
   
#### Pour les nantais
<pre>
 +--------+     +---------+     +---------+     +---------+     +-------+
 |        |     |         |     |         |     |         |     |       |
 |  User  | ==> | Transit | ==> | Bastion | ==> | Skinner | ==> |  GPU  |
 |        |     |         |     |         |     |         |     |       |
 +--------+     +---------+     +---------+     +---------+     +-------+
</pre>

1. Lancer le port forwarding: `ssh -L <port_notebook>:localhost:<port_notebook> <user_nantes>@bastion.etu.univ-nantes.fr -t ssh -L <port_notebook>:localhost:<port_notebook> <user_lemans>@skinner -t ssh -L <port_notebook>:localhost:<port_notebook> gpue<X>`

### A la casa
<pre>
 +--------+     +---------+     +---------+     +-------+
 |        |     |         |     |         |     |       |
 |  User  | ==> | Transit | ==> | Skinner | ==> |  GPU  |
 |        |     |         |     |         |     |       |
 +--------+     +---------+     +---------+     +-------+
</pre>

1. Lancer le port forwarding: `ssh -L <port_notebook>:localhost:<port_notebook> <user_lemans>@transit.univ-lemans.fr -t ssh -L <port_notebook>:localhost:<port_notebook> skinner -t ssh -L <port_notebook>:localhost:<port_notebook> gpue<X>`


## N.B

* Dans le port forwarding je propose de mettre le même numéro de port par simplicitée, il est possible de le changer entre chaque machine
* Ajouter `-t './jupyter.sh <numero_port>'` à la fin du port forward pour démarrer le notebook *
* Ajouter `-t './jupyter.sh stop'` à la fin du port forward pour stopper le notebook *

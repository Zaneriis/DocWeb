# DocWeb

Projet 2 : NoDEfr-2, une norme pour la description des offres de formation
Contexte
Un groupe d'experts de l'AFNOR travaillent depuis deux ans sur la spécification d'un modèle conceptuel pour la description des offres de formation (NoDEfr-2). Le méta modèle utilisé pour modéliser le NoDEfr-2 est celui proposé par l'ISO dans le cadre du MLR. Le paradigme de ce méta-modèle (ensembliste reposant sur la description de classes et d'éléments de données) est proche de ceux proposés par le W3C pour le web des données (RDFS) et le web sémantique (OWL2). Pour travailler les experts utilisent un tableur (document semi-formel): un onglet représente les classes, et les autres onglets (un par classe) leurs propriétés (éléments de données). L'objectif de ce projet est de formaliser automatiquement ce travail pour générer automatiquement des schémas RDFS et OWL.

Projets pour chaque équipe
- (2 personnes) développement d'une grammaire XSD pour valider des fichiers XML qui formaliseraient les classes et éléments de données du NoDEfr-2
- (2 personnes) formalisation des informations semi structurées issus d'un tableur calc. Le programme prendra en entrée un ods et générera un fichier XML compatible avec le schéma XML du l'équipe 1
- (2 personnes) génération d'un schéma RDF (au format turtle) à partir du fichier XML produit par l'équipe 2
- (3 personnes) génération d'un schéma OWL2 (au format turtle) à partir du fichier XML produit par l'équipe 2

# Projet

## Table des matières

    1. Objectif
    2. Description de l'infrastructure
    3. Compétences Mobilisées
---

## Objectif

Le but de projet est de mettre à disposition une infrastructure cloud qui héberge une plateforme de calcul big data pour des services internes de l'entreprise. Pour chaque projet qui demande une plateforme, un pipeline déploie toutes les ressources nécessaires à la plateforme, met en place les sécurités réseaux, donne les accès au utilisateurs. Tout au long du pipeline les tests suivants sont à éxecuter : sécurité du code (gestion des secrets, vérification de l'absence des failles connues), test de fonctionnement des ressources déployées. Exécution de infracost pour éditer un rapport chiffré de l'estimation du coût de l'infrastructure déployées

---

## Description de l'infrastructure

Dans un premier groupe de ressource, un serveur Gitleb-ci et un runner gitlab permettent d'héberger le repo général qui contient tous les modules et sous modules Terraform qui permettent de déployer les infrastructures clients grâce aux pipelines éxecuter par le runner gitlab. Lors d'une demande client, création d'un repo dédié sur gitlab-ci qui contient le fichier de variable de description de l'infrastructure cliente et le main.tf qui appelle les modules idoines.

---

### technologies utilisées

    - Terraform pour provisionner les ressources et mettre en place les autorisation dans l'Azure AD
    - Ansible pour configurer et administrer les ressources

---

### Schéma synthétique Gitlab

::: mermaid
graph LR;
    T -- HTTPS --> A
    U -- Projet --> T
    B -- déploie --> F

    subgraph User
        U[Client]
    end

    subgraph Team
        T[administrateur]
    end
    subgraph AZURE
        subgraph RG GITLAB
            A[Gitlab-ci]
            B[runner Gitlab]
            C[Gitlab Backend]
            D[DB Gitlab]
            E[Container Registry]
            A -- data --> D
            A -- states containers --> C
            A -- pipeline --> B
            B -- build --> E 
        end
        subgraph Landing
            F[RG Client]
        end
    end
:::

---

### Schéma syntétique Plateform

:::mermaid
graph LR;
    RG_GITLAB -- déploie --> RG_PROJET
    H -- Qlik --> D
    A -- NoteBooks --> F
    A -- Read --> G

    subgraph user
        A[Client]
    end
    subgraph On_Prem
        H[DB on premise]
    end
    subgraph AZURE
        subgraph RG_GITLAB
            B[GITLAB]
        end
        subgraph RG_PROJET
            subgraph VNET
                C[Key Vault]
                D[Datalake gen2]
                E[Datafactory]
                F[Databricks]
                G[PowerBi]
            end
        end
    end
:::

### Sécurisation

Utilisation du registry Terraform AzureAd pour gérer les users et les groupes, mise en place de white liste IP pour le firewall, utilisation des sas key pour les accès des services principals, des users et des groupes

Mise en place de backup pour la BD Gitlab, et du storage account des tf.state

## Compétences mobilisées

    1.  Automatiser la création de serveurs à l’aide de scripts
    2.  Automatiser le déploiement d'une infrastructure
    3.  Sécuriser l’infrastructure
    4.  Mettre l’infrastructure en production dans le cloud
    5.  Préparer un environnement de test
    6.  Gérer le stockage des données
    7.  Gérer des containers
    8.  Automatiser la mise en production d’une application avec une plateforme
    9.  Définir et mettre en place des statistiques de services
    10. Exploiter une solution de supervision

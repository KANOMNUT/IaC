# Application Gateway Ingress Class (AGIC) for AKS
##

## Prerequisites
- AKS Cluster
- Application Gateway
- Managed Identities
- Key Vaults 

## Steps
- Create new AKS with AGIC or Install AGIC to exisiting AKS. [How to Install AGIC](https://learn.microsoft.com/en-us/azure/application-gateway/ingress-controller-install-existing)
- Create new Listener HTTPS on Azure Application Gateway.
    -   Upload you certificate to Azure Application Gateway.
    -   Import from Azure Key Vaults.
        -   Create Azure Managed Identities.
        -   Create Azure Key Vaults and assign permission to Azure Managed Identities.
        -   Import/Generate Certificate in Key Vaults.
        -   Assign Listener to Rules
-   Test to access service via HTTPS.

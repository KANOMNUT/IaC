# Role & Role Binding on AKS with Azure AD with Kubernetes RBAC

This guide explains how to set up Role & Role Binding on an AKS cluster using Azure AD and Kubernetes RBAC. The setup involves creating a group in Azure AD, editing a custom role, changing the group ID in a role-binding file, and applying the role and role binding files to AKS.
#


## Prerequisites

-   AKS Cluster
-   Permission to create group in Azure AD (Global Admin, User Admin, Groups Admin & Helpdesk Admin)
-   kubectl command 
#

## Steps

-  Create Group and assign users in Azrue AD.
-  Edit custom Role and namespace in role.yaml file.
-  Change group ID and namespace in role-binding.yaml.
-  Apply Role & Role Binding file to AKS.

    ```bash
    kubectl apply -f role.yaml -f role-binding.yaml
    ```

-  Connect to AKS using **kubectl** to verify Role & Role Binding have been applied correctly.
#






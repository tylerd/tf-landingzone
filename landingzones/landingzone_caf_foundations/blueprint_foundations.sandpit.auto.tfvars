# Sample Cloud Adoption Framework foundations landing zone

## globalsettings
global_settings = {
    #specifies the set of locations you are going to use in this landing zone
    location_map = {
        region1   = "westus2"
        region2   = "westcentralus"
    }

    #naming convention to be used as defined in naming convention module, accepted values are cafclassic, cafrandom, random, passthrough
    convention = "cafrandom"

    #Set of tags for core operations
    tags_hub = {
        environment     = "DEV"
        owner           = "CAF"
        deploymentType  = "Terraform"
        costCenter      = "0000"
        BusinessUnit    = "SHARED"
        DR              = "NON-DR-ENABLED"
    }

    # Set of resource groups to land the blueprint
    resource_groups_hub = {
        HUB-CORE-SEC    = {
            name = "-hub-core-sec"
            location = "westus2"
        }
        HUB-OPERATIONS  = {
            name = "-hub-operations"
            location = "westus2"
        }
    }
}

## accounting settings
accounting_settings = {
    # Azure Subscription activity logs retention period 
    azure_activity_logs_name = "actlogs"
    azure_activity_logs_event_hub = true
    azure_activity_logs_retention = 365

    # Azure diagnostics logs retention period
    azure_diagnostics_logs_name = "diaglogs"
    azure_diagnostics_logs_event_hub = true

    #Logging and monitoring 
    analytics_workspace_name = "lalogs"

    ##Log analytics solutions to be deployed 
    solution_plan_map = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
        ADAssessment = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ADAssessment"
        },
        ADReplication = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ADReplication"
        },
        AgentHealthAssessment = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/AgentHealthAssessment"
        },
        DnsAnalytics = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/DnsAnalytics"
        },
        ContainerInsights = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/ContainerInsights"
        },
        KeyVaultAnalytics = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/KeyVaultAnalytics"
        }
    }
}

## governance
governance_settings = {
    
    policy_matrix = {
    #autoenroll_asc          = true - to be implemented via builtin policies
    autoenroll_monitor_vm   = false
    autoenroll_netwatcher   = false

    no_public_ip_spoke      = false
    cant_create_ip_spoke    = false 
    managed_disks_only      = true
    restrict_locations      = false
    list_of_allowed_locs    = ["westus2", "westcentralus"]
    restrict_supported_svc  = false
    list_of_supported_svc   = ["Microsoft.Network/publicIPAddresses", "Microsoft.Compute/disks"]
    msi_location            = "westus2"
    }
}

## security 
security_settings = {
    #Azure Security Center Configuration 
    enable_security_center = false
    security_center = {
        contact_email   = "email@email.com" 
        contact_phone   = "9293829328"
    }
    #Enables Azure Sentinel on the Log Analaytics repo
    enable_sentinel = false
}

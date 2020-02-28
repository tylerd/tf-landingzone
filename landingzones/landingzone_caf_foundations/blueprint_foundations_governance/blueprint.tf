
# azure policies
module "custom_policies" {
  source = "./policies/custom"


  policies_matrix         = var.governance_settings.policy_matrix
  log_analytics           = var.log_analytics.name
  scope                   = data.azurerm_subscription.current.id
}

module "builtin_policies" {
  source = "./policies/builtin"
  
  policies_matrix         = var.governance_settings.policy_matrix
  log_analytics           = var.log_analytics.name
  //log_analytics needed for policies with auto-remediation 
  scope                   = data.azurerm_subscription.current.id
}
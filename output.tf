output "subscriptions" {
  value = {
    for env_k, env_v in var.subscription :
    env_k => {
      "id"   = try(jsondecode(data.restful_resource.subscription_metadata[env_k].output).subscription.Id, env_v.subscription_id)
      "name" = env_v.name
    }
  }
}
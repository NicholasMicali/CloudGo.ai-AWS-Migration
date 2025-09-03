# Locals for computed values or convenience
locals {
  amplify_env_vars = merge({
    NODE_ENV = "production"
  }, var.environment_variables)
}

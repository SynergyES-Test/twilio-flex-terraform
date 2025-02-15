variable "TWILIO_ACCOUNT_SID" {
  type        = string
  sensitive   = false
  description = "Twilio Account SID"
}

variable "TWILIO_API_KEY" {
  type        = string
  sensitive   = false
  description = "Twilio API key"
}

variable "TWILIO_API_SECRET" {
  type        = string
  sensitive   = true
  description = "Twilio API secret"
}
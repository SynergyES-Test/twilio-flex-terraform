output "voice_task_channel" {
  value = data.twilio_taskrouter_task_channel.voice.sid
  description = "SID of the voice task channel"
}

output "default_workflow" {
  value       = twilio_taskrouter_workflow.default.sid
  description = "SID of the default workflow"
}

output "workspace_name" {
  value = data.twilio_taskrouter_workspace.flex.friendly_name
  description = "Friendly name of the workspace"
}
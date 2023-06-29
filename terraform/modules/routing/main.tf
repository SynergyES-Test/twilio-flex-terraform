terraform {
  required_providers {
    twilio = {
      source = "RJPearson94/twilio"
      version = ">=0.23.0"
    }
  }
}

data "twilio_taskrouter_workspace" "flex" {
  sid = var.flex_workspace_sid
}

data "twilio_taskrouter_task_channel" "voice" {
  workspace_sid	= data.twilio_taskrouter_workspace.flex.sid
  unique_name = "voice"
}


resource "twilio_taskrouter_task_queue" "all" {
  workspace_sid	= data.twilio_taskrouter_workspace.flex.sid
  friendly_name	= "All"
  target_workers = "1==1"
}

resource "twilio_taskrouter_task_queue" "sales" {
  workspace_sid	= data.twilio_taskrouter_workspace.flex.sid
  friendly_name	= "Sales"
  target_workers = "skills HAS \"sales\""
}

resource "twilio_taskrouter_task_queue" "support" {
  workspace_sid	= data.twilio_taskrouter_workspace.flex.sid
  friendly_name	= "Support"
  target_workers = "skills HAS \"support\""
}

resource "twilio_taskrouter_workflow" "default" {
  workspace_sid = data.twilio_taskrouter_workspace.flex.sid
  friendly_name = "Default workflow"
  configuration = templatefile("../../../taskrouter/workflow.json", local.params)
}

locals{
  params = {
    "SUPPORT_QUEUE_SID" = twilio_taskrouter_task_queue.support.sid
    "SALES_QUEUE_SID" = twilio_taskrouter_task_queue.sales.sid
    "ALL_QUEUE_SID" = twilio_taskrouter_task_queue.all.sid
  }
}



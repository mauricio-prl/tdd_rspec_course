module ApplicationHelper
  def flash_messages
    classes = {
      'notice' => 'success',
      'alert' => 'danger'
    }

    render 'layouts/flash_message', alert_classes: classes
  end
end

module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction, page: nil).permit!, {class: css_class}
  end

  def boolean_to_icon(bool)
    return (bool)? "<i class='ion-checkmark'></i>" : "<i class='ion-close'></i>"
  end

  def flash_message(message,type)
    if type.nil? or type.empty? or type=='notice'
      title = "Aviso"
      html_class =  "alert-info"
    elsif type=='alert'
      title = "Atenção"
      html_class =  "alert-warning"
    elsif type=='error'
      title = "Error"
      html_class =  "alert-danger"
    end

    html = %Q{
      <div class="alert #{html_class} alert-dismissible text-center">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
      <strong>#{message}</strong>
      </div>
    }

    return html
  end
end
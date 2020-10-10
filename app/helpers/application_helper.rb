module ApplicationHelper
  def asset_exists?(path)
    Rails.application.assets.find_asset(path).present?
  end

  def active_class(paths = [], custom_class = nil)
    active_page = []
    paths.each do |path|
      current_route = Rails.application.routes.recognize_path(path)
      active_page << true if current_page?(path) || params[:controller] == current_route[:controller]
    end
    return unless active_page.include?(true)

    custom_class.present? ? custom_class : 'active'
  end

  def default_currency(value)
    ActionController::Base.helpers.number_to_currency(value, unit: 'Rp ', delimiter: '.', precision: 0)
  end

  def default_date(value)
    value.to_date.strftime('%d %B %Y')
  end

  def default_datetime(value)
    value.strftime('%I:%M %p %A, %d %B %Y')
  end

  def birth_date_place(place, date)
    "#{place}, #{date.to_date.strftime('%d %B %Y')}"
  end

  def check_value?(resource)
    return raw("<i class='fas fa-check'></i>".html_safe) if resource

    raw("<i class='fas fa-times'></i>".html_safe)
  end

  def to_download(url)
    return if url.nil?

    link_to File.basename(url).truncate(30), url, title: "#{File.basename(url)}",
            class: 'badge badge-secondary', target: '_blank'
  end

  def to_download_url(url)
    return if url.nil?

    link_to url.truncate(30), url, title: "#{url}", class: 'badge badge-secondary',
            target: '_blank'
  end

  def to_download_info(url)
    return if url.nil?

    link_to "#{t('button.current_file')} #{File.basename(url).truncate(30)}", url,
            title: "#{File.basename(url)}", class: 'badge badge-secondary', target: '_blank'
  end

  def to_download_image(url)
    return if url.nil?

    link_to (image_tag url, width: 200, style: 'margin-top: 5px;'), url, target: '_blank'
  end
end

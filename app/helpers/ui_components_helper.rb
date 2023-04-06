module UiComponentsHelper
  def r_card(stretch_height: true, &block)
    render "shared/components/card", stretch_height: stretch_height, &block
  end

  def r_card_title(title=nil, actions: nil, &block)
    render "shared/components/card_title", title: title, actions: actions, &block
  end

  def r_card_subtitle(title=nil, &block)
    render "shared/components/card_subtitle", title: title, &block
  end

  def r_card_content(&block)
    render "shared/components/card_content", &block
  end

  def r_card_footer(justify: :end, &block)
    render "shared/components/card_footer", justify: justify, &block
  end

  def r_table(align: :middle, klass: "", id: nil, &block)
    render "shared/components/table", align: align, klass: klass, id: id, &block
  end

  def r_name_value_table(&block)
    render "shared/components/name_value_table", &block
  end

  def r_name_value(name: nil, value: nil, &block)
    render "shared/components/name_value", name: name, value: value, &block
  end

  def r_badge(text: nil, style: :primary, icon: nil, id: nil, modal_id: nil, dropdown_actions: nil, onclick: nil)
    render "shared/components/badge", text: text, style: style, icon: icon, id: id, modal_id: modal_id, dropdown_actions: dropdown_actions, onclick: onclick
  end

  def r_button(text: nil, style: :primary, size: :md, disabled: false, icon: nil, id: nil, modal_id: nil, dropdown_actions: nil, path: nil, method: nil, confirm: nil, external: nil, onclick: nil, remote: nil, classes: nil)
    style ||= :primary
    tag = :button
    tag = :a if path.present?
    render "shared/components/button", tag: tag, text: text, style: style, size: size, disabled: disabled, icon: icon, id: id, modal_id: modal_id, dropdown_actions: dropdown_actions, path: path, method: method, confirm: confirm, external: external, onclick: onclick, remote: remote, classes: classes
  end

  def r_form(type: :text, label: nil, field: nil, value: nil, options: {}, placeholder: nil, required: false, disabled: false, autofocus: false, pattern: nil, rows: 10, step: 1, min: nil, max: nil, multiple: false, vertical: false)
    render "shared/components/form_set", type: type, label: label, field: field, required: required do
      case type
      when :hidden
        hidden_field_tag field, value, required: required
      when :text
        text_field_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, pattern: pattern, maxlength: max
      when :text_number
        text_field_tag field, value, class: "form-control only-number", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, maxlength: max
      when :text_area
        text_area_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, rows: rows
      when :number
        number_field_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, step: step, min: min, max: max
      when :email
        email_field_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :password
        password_field_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :url
        url_field_tag field, value, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :date
        date_field_tag field, value, class: "form-control", required: required, disabled: disabled, autofocus: autofocus
      when :datetime
        datetime_field_tag field, value, class: "form-control", required: required, disabled: disabled, autofocus: autofocus
      when :select
        select_tag field, options_for_select(options.to_a.map(&:reverse), value), include_blank: true, class: "form-select", required: required, disabled: disabled, autofocus: autofocus, multiple: multiple
      when :select2
        select_tag field, options_for_select(options.to_a.map(&:reverse), value), include_blank: true, class: "form-select select2", required: required, disabled: disabled, autofocus: autofocus, multiple: multiple
      when :checkbox
        render "shared/components/form_options_check", form: nil, field: field, value: value, options: options, vertical: vertical, required: required, disabled: disabled, autofocus: autofocus
      when :radio
        render "shared/components/form_options_radio", form: nil, field: field, value: value, options: options, vertical: vertical, required: required, disabled: disabled, autofocus: autofocus
      when :color
        color_field_tag field, value, class: "form-control form-control-color", required: required, disabled: disabled, autofocus: autofocus
      end
    end
  end

  def r_form_of(f, type: :text, label: nil, field: nil, options: {}, placeholder: nil, required: false, disabled: false, autofocus: false, pattern: nil, rows: 10, step: 1, min: nil, max: nil, multiple: false, vertical: false, additional_options: {})
    render "shared/components/form_set", type: type, label: label, field: field, required: required do
      case type
      when :hidden
        f.hidden_field field, required: required
      when :text
        f.text_field field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, pattern: pattern
      when :text_number
        f.text_field field, class: "form-control only-number", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :text_area
        f.text_area field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, rows: rows
      when :number
        f.number_field field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus, step: step, min: min, max: max
      when :email
        f.email_field field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :password
        f.password_field field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :url
        f.url_field field, class: "form-control", placeholder: placeholder, required: required, disabled: disabled, autofocus: autofocus
      when :date
        f.date_field field, class: "form-control", required: required, disabled: disabled, autofocus: autofocus
      when :datetime
        f.datetime_field field, class: "form-control", required: required, disabled: disabled, autofocus: autofocus
      when :select
        f.select field, options_for_select(options.to_a.map(&:reverse), f.object.send(field)), {include_blank: true}, {class: "form-select", required: required, disabled: disabled, autofocus: autofocus, multiple: multiple}.merge(additional_options)
      when :select2
        f.select field, options_for_select(options.to_a.map(&:reverse), f.object.send(field)), {include_blank: true}, {class: "form-select select2", required: required, disabled: disabled, autofocus: autofocus, multiple: multiple}
      when :checkbox
        render "shared/components/form_options_check", form: f, field: field, options: options, vertical: vertical, required: required, disabled: disabled, autofocus: autofocus
      when :radio
        render "shared/components/form_options_radio", form: f, field: field, options: options, vertical: vertical, required: required, disabled: disabled, autofocus: autofocus
      when :color
        f.color_field field, class: "form-control form-control-color", required: required, disabled: disabled, autofocus: autofocus
      end
    end
  end

  def r_submit(text: "Save", style: :primary, size: :lg, disabled: false, confirm: nil, disable_with: nil, klass: nil)
    submit_tag text, class: "btn btn-#{style.to_s.gsub("_", "-")} btn-#{size} #{klass}", disabled: disabled, data: { disable_with: disable_with, confirm: confirm }
  end
end
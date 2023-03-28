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
end
module FormHelper
  def no_auto
    { autocomplete: "off",
      autocorrect: "off",
      spellcheck: "false",
      autocapitalize: "off" }
  end
end

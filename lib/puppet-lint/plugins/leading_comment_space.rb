# Checks that there is a space after comma
PuppetLint.new_check(:leading_comment_space) do
  def check
    tokens.select { |r| r.type == :COMMENT }.each do |token|
      next if token.value =~ /^\#*$/
      next if token.value =~ /^\#* /

      notify :warning,
             message: 'Add space after #',
             line: token.line,
             column: token.column,
             token: token
    end
  end

  def fix(problem)
    problem[:token].value.gsub!(/^(\#*)/, '\1 ')
  end
end

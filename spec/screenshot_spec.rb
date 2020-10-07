
#  salva em uma pasta log as telas de testes ##

describe 'Meu primeiro script' do
    it 'Visitar página' do
        
    end
end

describe 'forms' do
    
    it 'Login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'username', with: 'stark' # click dentro da caixa nome e deppois click inspecionar para ver o codigo. 
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

       expect(find('#flash').visible?).to be true

       expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

       expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'

        page.save_screenshot('log/login_com_sucesso.png')

    end

    it 'Senha incorreta', :temp do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'xpto123'

        click_button 'Login'

        expect(find('#flash')).to have_content 'Senha é invalida!'

        #page.driver.browser.switch_to.alert.accept

        page.save_screenshot('log/senha_incorreta.png')
        
    end

    it 'Usuario não cadastrado' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with: 'hulk'
        fill_in 'password', with: 'xpto123'

        click_button 'Login'

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        
        #page.driver.browser.switch_to.alert.accept

        page.save_screenshot('log/usuario_nao_cadastrado.png')
    end
end  
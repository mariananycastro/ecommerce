require 'rails_helper'

feature 'Admin register solar plate' do 
  scenario 'successfully' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Dashboard'
    click_on 'Produtos'
    click_on 'Adicionar nova Placa Solar'

    fill_in 'Nome', with: 'Placa solar A'
    fill_in 'Largura (mm)', with: 2024
    fill_in 'Altura (mm)', with: 1004
    fill_in 'Espessura (mm)', with: 35
    fill_in 'Peso (kg)', with: 24.9
    fill_in 'Preço de compra', with: 2000.0
    fill_in 'SKU', with: 'WEG-G-00172'
    fill_in 'Eficiência (%)', with: 18.15
    fill_in 'Potência Nominal (Wp)', with: 360
    click_on 'Enviar'
    
    expect(page).to have_content('Placa solar cadastrada com sucesso')
    expect(page).to have_content('Nome: Placa solar A')
    # expect(page).to have_content('Dimensão: 2024mm (L) × 1004mm (A) × 35mm (E)')
    #TODO Peso com 2 casas decimais, number_to_currency
    # expect(page).to have_content('Peso: 24.90 kg')
    # expect(page).to have_content('Preço de compra: R$ 2000,00')
    expect(page).to have_content('SKU: WEG-G-00172')
    expect(page).to have_content('Eficiência: 18.15%')
    expect(page).to have_content('Potência Nominal: 360Wp')
  end
end
ActiveAdmin.register_page 'import_data_from_csv' do
  menu priority: 3, label: 'Import Data From CSV'

  #TODO implement features, created this controller for csv uploader functionality

  page_action :import_data, method: :post do
    data_was_imported = ImporterCsvData.call(params['file'])

    #TODO implement functionality render message about created products and users

    render partial: '/admin/import_data_from_csv'
  end

  content do
    render partial: '/admin/import_data_from_csv'
  end
end


public with sharing class ViaCEP_DTO {
    public class ViaCepJSON {
		public string cep { get; set; }
		public string logradouro { get; set; }
		public string complemento { get; set; }
		public string bairro { get; set; }
		public string localidade { get; set; }
		public string uf { get; set; }
		public integer ibge { get; set; }
		public integer gia { get; set; }
		public integer ddd { get; set; }
		public integer siafi { get; set; } 
	}
}
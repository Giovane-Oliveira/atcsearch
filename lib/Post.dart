class Post{

  Post(
      this._cod_grade,
      this._box_inicial,
      this._box_final,
      this._box_total,
      this._data_processo,
      this._umidade,
      this._peso_amostra,
      this._leitura_nicotina,
      this._leitura_acucar,
      this._result_nicotina,
      this._result_acucar,
      this._des_grade,
      this._des_pessoa,
      this._user_insercao,
      this._dt_hr_insercao,
      this._user_alteracao,
      this._dt_hr_alteracao,
      this._nic_tipo_calculo);


  int _cod_grade;
  int _box_inicial;
  int _box_final;

  int get cod_grade => _cod_grade;

  set cod_grade(int value) {
    _cod_grade = value;
  }

  int _box_total;
  String? _data_processo;
  String? _umidade;
  String? _peso_amostra;
  String? _leitura_nicotina;
  String? _leitura_acucar;
  String? _result_nicotina;
  String? _result_acucar;
  String? _des_grade;
  String? _des_pessoa;
  String? _user_insercao;
  String? _dt_hr_insercao;
  String? _user_alteracao;
  String? _dt_hr_alteracao;
  String? _nic_tipo_calculo;

  int get box_inicial => _box_inicial;

  set box_inicial(int value) {
    _box_inicial = value;
  }

  int get box_final => _box_final;

  set box_final(int value) {
    _box_final = value;
  }

  int get box_total => _box_total;

  set box_total(int value) {
    _box_total = value;
  }

  String? get data_processo => _data_processo;

  set data_processo(String? value) {
    _data_processo = value;
  }

  String? get umidade => _umidade;

  set umidade(String? value) {
    _umidade = value;
  }

  String? get peso_amostra => _peso_amostra;

  set peso_amostra(String? value) {
    _peso_amostra = value;
  }

  String? get leitura_nicotina => _leitura_nicotina;

  set leitura_nicotina(String? value) {
    _leitura_nicotina = value;
  }

  String? get leitura_acucar => _leitura_acucar;

  set leitura_acucar(String? value) {
    _leitura_acucar = value;
  }

  String? get result_nicotina => _result_nicotina;

  set result_nicotina(String? value) {
    _result_nicotina = value;
  }

  String? get result_acucar => _result_acucar;

  set result_acucar(String? value) {
    _result_acucar = value;
  }

  String? get des_grade => _des_grade;

  set des_grade(String? value) {
    _des_grade = value;
  }

  String? get des_pessoa => _des_pessoa;

  set des_pessoa(String? value) {
    _des_pessoa = value;
  }

  String? get user_insercao => _user_insercao;

  set user_insercao(String? value) {
    _user_insercao = value;
  }

  String? get dt_hr_insercao => _dt_hr_insercao;

  set dt_hr_insercao(String? value) {
    _dt_hr_insercao = value;
  }

  String? get user_alteracao => _user_alteracao;

  set user_alteracao(String? value) {
    _user_alteracao = value;
  }

  String? get dt_hr_alteracao => _dt_hr_alteracao;

  set dt_hr_alteracao(String?value) {
    _dt_hr_alteracao = value;
  }

  String? get nic_tipo_calculo => _nic_tipo_calculo;

  set nic_tipo_calculo(String? value) {
    _nic_tipo_calculo = value;
  }
}
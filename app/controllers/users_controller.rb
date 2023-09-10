class UsersController < ApplicationController
  before_action :move_to_index
  # before_action :calendar_param, only: [:show, :callback]

  def show
    @nickname = current_user.nickname
    @user = User.find(current_user.id)
    @plans = @user.plans
    @records = @user.records

    #planのあるprefecture_idを@pref_has_planへ格納
    pref_has_plan = []
    @plans.each do |plan|
      unless pref_has_plan.include?(plan.prefecture_id)
        pref_has_plan << plan.prefecture_id
      end
    end
    @pref_has_plan = pref_has_plan.sort

    #recordのあるprefecture_idを@pref_has_recordへ格納
    pref_has_record = []
    @records.each do |record|
      unless pref_has_record.include?(record.prefecture_id)
        pref_has_record << record.prefecture_id
      end
    end
    @pref_has_record = pref_has_record.sort


    #
    # token_path = 'token.yml' # ユーザーのAPIトークンの保存先
    # scope = Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS # Google Cloudコンソールで設定したスコープ
    # callback_path = '/google_calendar/callback' # Google Cloudコンソールで設定したリダイレクトURIのパス部分

    # oauth_client = Google::Auth::UserAuthorizer.new(
    # Google::Auth::ClientId.from_file(token_path),
    # scope,
    # Google::Auth::Stores::FileTokenStore.new(file: token_path),
    # callback_path
    # )
    # base_url = 'http://localhost:3000' # Google Cloudコンソールで設定したリダイレクトURIのベース部分

    # @authorization_url = oauth_client.get_authorization_url(base_url: base_url)
    #
  end
#   def callback
#     token_path = 'token.yml' # ユーザーのAPIトークンの保存先
#     scope = Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS # Google Cloudコンソールで設定したスコープ
#     callback_path = '/google_calendar/callback' # Google Cloudコンソールで設定したリダイレクトURIのパス部分

#     oauth_client = Google::Auth::UserAuthorizer.new(
#     Google::Auth::ClientId.from_file(token_path),
#     scope,
#     Google::Auth::Stores::FileTokenStore.new(file: token_path),
#     callback_path
#     )
#     base_url = 'http://localhost:3000' # Google Cloudコンソールで設定したリダイレクトURIのベース部分

#     # 認可サーバーから発行された認可コードを使用して、APIトークンを保存する

#     code = params[:code] # 認可コード

#     oauth_client.get_and_store_credentials_from_code( # Google::Auth::UserAuthorizerのインスタンス
#     user_id: current_user.id, # ログイン済みのユーザーと仮定して、ユーザーIDを渡す
#     code: code,
#     base_url: base_url
#     )

#     credentials = oauth_client.get_credentials(current_user.id)

#     calendar_service = Google::Apis::CalendarV3::CalendarService.new
#     calendar_service.client_options.application_name = 'iscopy' # Google Cloudコンソールで登録したアプリケーション名
#     calendar_service.authorization = credentials # Google::Auth::UserAuthorizerから受け取った認証情報

#     event = Google::Apis::CalendarV3::Event.new(
#       summary: ‘イベントのタイトル’, # イベントのタイトル
#       location: 'イベントの場所', # 場所
#       description: 'イベントの説明文。', # 説明
#       start: Google::Apis::CalendarV3::EventDateTime.new( # 開始日時
#         date_time: Time.current.rfc3339, # RFC3339のフォーマット指定あり
#         time_zone: 'Asia/Tokyo' #タイムゾーン
#       ),
#       end: Google::Apis::CalendarV3::EventDateTime.new( # 終了日時
#         date_time: Time.current.since(3.hour).rfc3339,
#         time_zone: 'Asia/Tokyo'
#       )
#     )
#     calendar_id = 'primary' # カレンダーID。デフォルトはprimary

# registered_event = calendar_service.insert_event(calendar_id, event)
#   end
  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  # def calendar_param
  #   token_path = 'token.yml' # ユーザーのAPIトークンの保存先
  #   scope = Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS # Google Cloudコンソールで設定したスコープ
  #   callback_path = '/google_calendar/callback' # Google Cloudコンソールで設定したリダイレクトURIのパス部分

  #   oauth_client = Google::Auth::UserAuthorizer.new(
  #   Google::Auth::ClientId.from_file(token_path),
  #   scope,
  #   Google::Auth::Stores::FileTokenStore.new(file: token_path),
  #   callback_path
  #   )
  #   base_url = 'http://localhost:3000' # Google Cloudコンソールで設定したリダイレクトURIのベース部分

  # end
end

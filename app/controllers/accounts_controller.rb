class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = Account.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
      format.json  { render :json => @accounts }
    end
  end

  def transactions
    @transactions = Transaction.find(:all, :conditions => {:account_id => params[:id]})

    respond_to do |format|
      format.html # transactions.html.erb
      format.xml  { render :xml => @transactions }
      format.json  { render :json => @transactions }
    end
  end

  def since
    @account = Account.find(params[:id])
    @transactions = Transaction.find(:all, :conditions => ["account_id = ? AND updated_at >= ?", params[:id], params[:date]])

    respond_to do |format|
      format.html # since.html.erb
      format.xml  { render :xml => @transactions }
      format.json  { render :json => @transactions }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    begin_date = params[:begin_date]
    end_date = params[:end_date]
    if (!begin_date)
      begin_date = DateTime.now.beginning_of_month
    end
    if (!end_date)
      end_date = begin_date.end_of_month
    end
    @account = Account.find(params[:id])
    @transactions = Transaction.find(:all, :conditions => ["account_id = ? AND date >= ? AND date <= ?", params[:id], begin_date, end_date],  :order => "date, itemno")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
      format.json { render :json => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
      format.json  { render :json => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to(@account) }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
        format.json  { render :json => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
        format.json  { render :json => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
        format.json { render :json}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
        format.json { render :json => @account.errors, :status => :unprocessable_entity}
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end

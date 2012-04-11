class CommentsController < ApplicationController
  # GET posts/1/comments
  # GET posts/1/comments.xml
  def index
    @comments = Post.find(params[:post_id]).comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET posts/1/comments/1
  # GET posts/1/comments/1.xml
  def show
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET posts/1/comments/new
  # GET posts/1/comments/new.xml
  def new
    @comment = Post.find(params[:post_id]).comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET posts/1/comments/1/edit
  def edit
    @comment = Post.find(params[:post_id]).comments.find(params[:id])
  end

  # POST posts/1/comments
  # POST posts/1/comments.xml
  def create
    @comment = Post.find(params[:post_id]).comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT posts/1/comments/1
  # PUT posts/1/comments/1.xml
  def update
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE posts/1/comments/1
  # DELETE posts/1/comments/1.xml
  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_url(post) }
      format.xml  { head :ok }
    end
  end
end

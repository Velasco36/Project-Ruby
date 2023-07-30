# app/controllers/models_controller.rb

class ModelController < ApplicationController
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.redirect(model_url(@model))
        end
        format.html { redirect_to model_url(@model), notice: "Actualizado." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # Otros métodos del controlador
end

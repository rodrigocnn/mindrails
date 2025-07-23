import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.renderGrid([]);
    this.loadData();
  }

  async loadData() {
    try {
      const response = await fetch("/admin/local_de_atendimentos.json");
      const data = await response.json();
      const rows = data.map((p) => [p.nome, p.cidade, p.id]);
      this.renderGrid(rows);
    } catch (error) {
      console.error("Erro ao carregar dados:", error);
    }
  }

  renderGrid(data) {
    this.element.innerHTML = "";
    if (this.gridInstance) {
      this.gridInstance.destroy();
    }

    this.gridInstance = new gridjs.Grid({
      columns: [
        "Nome",
        "Cidade",

        {
          name: "Ações",
          formatter: (_, row) => {
            const id = row.cells[2].data;
            return gridjs.html(`<div class="flex gap-4">
              <a href="/admin/pacientes/${id}/edit" class="text-blue-600 hover:text-blue-800" title="Editar">
                <i class="fa-solid fa-pencil"></i>
              </a>
              <a href="/admin/pacientes/${id}/edit" class="text-red-600 hover:text-red-800" title="Excluir">
                <i class="fa-solid fa-trash"></i>
              </a>
              </div>
            `);
          },
        },
      ],
      data: data,
      pagination: true,
      search: true,
      sort: true,
    });

    this.gridInstance.render(this.element);
  }
}

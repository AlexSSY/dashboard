import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="admin--table-resize"
export default class extends Controller {
  static values = { storageKey: String };
  column = null;
  startX = 0;
  startWidth = 0;

  connect() {
    this.loadColumnSizes();
  }

  startResize(event) {
    this.column = event.target.parentElement;
    this.startX = event.clientX;
    this.startWidth = this.column.offsetWidth;

    document.addEventListener("mousemove", this.resize);
    document.addEventListener("mouseup", this.stopResize);
  }

  resize = (event) => {
    if (this.column) {
      const delta = event.clientX - this.startX;
      const newWidth = this.startWidth + delta;
      this.column.style.width = `${newWidth}px`;
    }
  };

  stopResize = () => {
    if (this.column) {
      this.saveColumnSize(this.column.dataset.columnId, this.column.style.width);
    }
    document.removeEventListener("mousemove", this.resize);
    document.removeEventListener("mouseup", this.stopResize);
    this.column = null;
  };

  saveColumnSize(columnId, width) {
    const columnSizes = this.getColumnSizes();
    columnSizes[columnId] = width;
    localStorage.setItem(this.storageKeyValue || "table-column-sizes", JSON.stringify(columnSizes));
  }

  loadColumnSizes() {
    const columnSizes = this.getColumnSizes();
    Object.entries(columnSizes).forEach(([columnId, width]) => {
      const column = this.element.querySelector(`[data-column-id="${columnId}"]`);
      if (column) {
        column.style.width = width;
      }
    });
  }

  getColumnSizes() {
    const data = localStorage.getItem(this.storageKeyValue || "table-column-sizes");
    return data ? JSON.parse(data) : {};
  }
}
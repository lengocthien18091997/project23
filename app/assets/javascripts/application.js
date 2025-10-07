document.addEventListener("DOMContentLoaded", function() {
    const container = document.querySelector('[data-field-name="subjects"]');
    const addBtn = document.getElementById("add-subject");

    if (!container || !addBtn) return;

    addBtn.addEventListener("click", function() {
        const randomKey = Date.now(); // tránh trùng
        const newRow = document.createElement("div");
        newRow.classList.add("field-row", "mb-2", "d-flex", "align-items-center");
        newRow.innerHTML = `
      <input type="text"
             name="user[teacher_profile_attributes][subjects][subject_${randomKey}]"
             class="form-control me-2 w-50"
             placeholder="Tên môn học (VD: Toán)">
      <select name="user[teacher_profile_attributes][subjects][subject_${randomKey}]"
              class="form-select w-25">
        <option value="Cấp 1">Cấp 1</option>
        <option value="Cấp 2">Cấp 2</option>
        <option value="Cấp 3">Cấp 3</option>
      </select>
      <button type="button" class="btn btn-danger btn-sm ms-2 remove-row">–</button>
    `;
        container.appendChild(newRow);
    });

    container.addEventListener("click", function(e) {
        if (e.target.classList.contains("remove-row")) {
            e.target.closest(".field-row").remove();
        }
    });
});


document.addEventListener("DOMContentLoaded", function() {
    // --- Cho phần 'Ngày trong tuần & Buổi' ---
    const availContainer = document.querySelector('[data-field-name="availability"]');
    const addAvailBtn = document.getElementById("add-availability");

    if (availContainer && addAvailBtn) {
        addAvailBtn.addEventListener("click", function() {
            const randomKey = Date.now(); // tránh trùng
            const newRow = document.createElement("div");
            newRow.classList.add("field-row", "mb-2", "d-flex", "align-items-center");
            newRow.innerHTML = `
        <input type="text"
               name="user[teacher_profile_attributes][availability][day_${randomKey}]"
               class="form-control me-2 w-50"
               placeholder="Ngày trong tuần (VD: Thứ 2)">
        <select name="user[teacher_profile_attributes][availability][day_${randomKey}]"
                class="form-select w-25">
          <option value="Buổi sáng">Buổi sáng</option>
          <option value="Buổi chiều">Buổi chiều</option>
          <option value="Buổi tối">Buổi tối</option>
        </select>
        <button type="button" class="btn btn-danger btn-sm ms-2 remove-row">–</button>
      `;
            availContainer.appendChild(newRow);
        });

        availContainer.addEventListener("click", function(e) {
            if (e.target.classList.contains("remove-row")) {
                e.target.closest(".field-row").remove();
            }
        });
    }
});


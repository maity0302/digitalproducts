<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
  <title>Title</title>
</head>
<body class="bg-slate-50 antialiased">
<div class="container flex max-w-none flex-col">
  <jsp:include page="/includes/header.jsp"/>
  <main class="mb-6 flex h-full justify-center">
    <jsp:include page="/includes/sidebar.jsp"/>
    <div class="mx-auto flex-1 overscroll-contain px-6">
      <div class="max-w-screen">
        <!-- ADMIN-USER-IMAGE -->
        <div class="mt-6 max-w-full">
          <!-- Main content here -->
          <section class="flex flex-col gap-4 rounded-xl bg-white p-5">
            <div class="flex items-center justify-between">
              <div>
                <h2 class="text-xl font-bold text-indigo-500 md:text-2xl">Quản lý ảnh</h2>
                <p class="text-gray-600"></p>
              </div>
              <a href="<c:url value="/user/images?action=create"/>">
                <lord-icon src="https://cdn.lordicon.com/nhfyhmlt.json" trigger="loop" class="h-6 w-6"> </lord-icon>
              </a>
            </div>

            <!-- IMAGE -->
            <div id="image" class="columns-3xs gap-4">
              <c:forEach items="${images}" var="image">
                <figure v-for="image in images" class="py-2 [break-inside:avoid]">
                  <div class="group relative overflow-hidden rounded-xl">
                    <img
                            class="object-cover object-center transition duration-200 group-hover:scale-110"
                            src="${image.filePath}"
                            alt="${image.filePath}"
                    />
                    <div class="absolute inset-0 hidden px-4 py-3 group-hover:block">
                      <div class="flex justify-between">
                        <div class="flex flex-col text-white">
                          <a href="<c:url value="/image?id=${image.id}"/>"><p class="text-sm font-bold">${image.title}</p></a>
                          <p class="text-xs">${image.price}</p>
                        </div>
                        <div class="flex gap-x-2">
                          <a href="<c:url value="/user/images?action=edit&id=${image.id}"/>">
                            <button class="flex items-center rounded-full bg-white/20 p-2">
                              <lord-icon src="https://cdn.lordicon.com/hbigeisx.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                            </button>
                          </a>
                          <form method="post" action="<c:url value="/user/images"/>">
                            <input type="hidden" name="id" value="${image.id}" />
                            <input type="hidden" name="action" value="delete" />
                            <button type="submit" class="flex items-center rounded-full bg-white/20 p-2" title="Delete">
                              <lord-icon src="https://cdn.lordicon.com/kfzfxczd.json" trigger="hover" colors="primary:#ffffff" class="h-5 w-5"> </lord-icon>
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </figure>
              </c:forEach>
            </div>
            <!-- IMAGE - END -->
          </section>
        </div>
      </div>
    </div>
  </main>

</div>
</body>
</html>
